/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import entities.HotelOrderService;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Ashley
 */
public class HotelSerEntityManager extends AbstractEntityManager<HotelOrderService> {

    public HotelSerEntityManager() {
        super(HotelOrderService.class);
    }

    /**
     * Get all object
     *
     * @return List<OrderLine> : list of HotelOrderService object
     */
    public List<HotelOrderService> getAllFromDB() {
        List<HotelOrderService> list = super.getAll();
        return list;
    }

   
    /**
     * Get all active object
     *
     * @return List<OrderLine> : list of HotelOrderService object
     */
    public List<HotelOrderService> getAllActive() {
        List<HotelOrderService> list = new ArrayList<>();
        for(HotelOrderService hs:getAllFromDB()){
            if(hs.getIsActive()==true) list.add(hs);
        }
        return list;
    }
    
      public List<HotelOrderService> getByRoomID(int RoomId) {
        ArrayList<HotelOrderService> list = new ArrayList<>();
        for (HotelOrderService a : getAllActive()) {
            if (a.getRooms().getRoomId() == RoomId) {
                list.add(a);
            }
        }
        return list;
    }

    /**
     * Add new object which check validity
     *
     * @param instance
     * @return True:successfully added / False: add failed.
     */
    public boolean addNew(HotelOrderService instance) {

        if (super.insert(instance)) {
            DiaryEntityManager.createLog("Created product \"" + instance.getId() + "\"");
            return true;
        } else {
            System.out.println("Failed add order services from hotel");
            return false;
        }
    }

    public boolean edit(HotelOrderService instance) {

        HotelOrderService search = find(instance.getId());

        if (search == null || Objects.equals(search.getId(), instance.getId())) {
            if (super.update(instance)) {
                DiaryEntityManager.createLog("Edited HOTEL ORDER SER #" + instance.getId());
                return true;
            } else {
                return false;
            }
        }

        return false;

    }

    @Override
    public boolean delete(HotelOrderService instance) {
        try {

            if (super.delete(instance)) {
                DiaryEntityManager.createLog("Deleted order table \"" + String.valueOf(instance.getId()) + "\"");
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            System.out.println("Failed to disable instance: " + ex.getMessage());
            return false;
        }
    }
}
